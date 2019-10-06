# -*- coding: utf-8 -*-
import os
import logging
import time
import requests
import json
import sys
import sqlite3
from flask import Flask ,session, redirect , request, make_response, jsonify
from flask import render_template as template
from threading import Thread, Lock
import hashlib
import datetime
import libspy.geocoder
app = Flask(__name__, template_folder='templates', static_folder='static')

response = app.make_response('/') 

def locate():
	from flask import request
	client_ip = request.remote_addr
	try:
		print("---IP:",client_ip)
		if client_ip == "127.0.0.1":
			geo = geocoder.ip('me')
		else:
			geo = geocoder.ip(client_ip)
		if geo.latlng != []:
			#print {'ip':client_ip,'pays':geo.country,'region':geo.state,'ville':geo.city,'postal':geo.postal,'rue':geo.street,'latitude':geo.latlng[0],'longitude':geo.latlng[1]}
			return {'ip':client_ip,'pays':geo.country,'region':geo.state,'ville':geo.city,'postal':geo.postal,'rue':geo.street,'latitude':geo.latlng[0],'longitude':geo.latlng[1]}
	except:
		pass
		
	return {'ip': "0.0.0.0"}


SERVER_NAME = "eth.rigafterday.com:5000"

DEBUG = True

app = Flask(__name__)
app.config.from_object(__name__) 
"""
def db_thread ():
	global cround, bl
	conn = sqlite3.connect(DBSHARE_FILE)
	db = conn.cursor()

	while True:	
		for x in range (10):
			item = shqueue.get()
			db.execute ('INSERT INTO share VALUES (?,?,?,?,?)', item)	
			shqueue.task_done()
			conn.commit ()

			croundlock.acquire ()
			cround['shares'] += int (item [2])
			if item[0] in cround['accounts']:
				cround['accounts'][item[0]] += int (item [2])
			else:
				cround['accounts'][item[0]] = int (item [2])
			cround['miners'] = len (cround['accounts'])
			croundlock.release ()
		bllock.acquire ()

		# Событие найден блок
		if bl:
			bl = False
			bllock.realease ()
			# Обнуляем переменные адреса и шар
			accounts = {}
			totshare = 0
			# Вычитаем из полученого блока коммисию пула
			reward = BLOCK_REWARD - FEE
			# Запрашиваем из базы данных адреса майнеров и количество отправленных шар
			for row in db.execute('SELECT miner, sum(diff) FROM share GROUP BY miner'):
				accounts [row [0]] = row [1]
				totshare += row [1]

			# totshare : reward = sharegianni : rewardpergianni
			# Делаем разблокировку выплат
			paylock.acquire ()
			# Побдключаемся к базе данных выплат для записи данных о платежах
			conn2 = sqlite3.connect(DBPAYOUT_FILE)
			db2 = conn2.cursor()
			# запускаем цикл перевода майнерам
			for acc in accounts:
				racc = accounts[acc] * reward / float (totshare)
				# Вызов функции оплаты
				sendTransaction (acc, racc)
				# Запись в базу выплат информации об оплате
				db2.execute ('INSERT INTO payout VALUES (?,?,?,?)', [acc, accounts[acc], totshare, racc, str (time.time ())])	
			conn2.commit ()
			# отключаемся от базы
			conn2.close ()
			#  Закрываем возможность выплат, защита пула
			paylock.release()

			db.execute ('DELETE FROM share')	

			croundlock.acquire ()
			cround = {'shares': 0, 'accounts': {}, 'miners': 0}
			croundlock.release ()
		else:
			bllock.realease ()

	conn.close ()
"""
@app.route("/assets/images/:filepath:path",methods=['GET'])
@app.route('/static/:filepath:path',methods=['GET'])
#Download code
def server_static(filepath):
	##print"file:",filepath
	filepath  = filepath.replace("//static/","/")
	ext = filepath.split('.')[1]
	if "tracedata" not in filepath:
		if "assets/" in filepath:
			return app.send_static_file(filepath)
		if "Lib/" in filepath:
			return app.send_static_file(filepath)
		if ext.lower() != ("py" or "json" or "txt" or "$" or "md" or "sql" or "pem" or "config"):
			#if ext=="css": #print"LOAD CSS:",filepath
			return app.send_static_file(filepath)
		else: 
			return ""
	else:
		return ""


@app.route("/credits",methods=['GET'])
def rulesconfidential():
	return template("credits.html")

@app.route("/donate",methods=['GET'])
def rulesconfidential():
	return template("donate.html")

@app.route("/downloads",methods=['GET'])
def rulesconfidential():
	return template("downloads.html")
	
@app.route("/licence",methods=['GET'])
def rulesconfidential():
	return template("licence.html")
	
@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return template('error-page/index.html')

@app.errorhandler(500)
def page_not_found2(e):
    # note that we set the 404 status explicitly
    return template('error-page/index.html')

@app.route("/")
def aindex():
	return template("index.html")
# set the secret key.  keep this really secret:
app.secret_key = os.urandom(64)
if __name__ == "__main__":
	app.run(host="0.0.0.0", port=8900, threaded=True)
