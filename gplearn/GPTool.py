#coding: utf-8
"""
Genetic Programming Complete Tool for Scientific Research in Mathematics

"""
__version__ = "1.6.0001"

import gplearn.GP as GP
from multiprocessing import Pool

print("Bienvenue dans GPCT-SRM v"+ __version__)

parammathdict = {
	1: ('add','sub','mul','div'),
	2: "all",
	3: ('add','sub','mul','div','hypot','sin','cos','tan'),
	4: ('add','sub','mul','div','max','min','abs'),
	5: ('add','sub','mul','div','sqrt','log','abs','neg','inv','sin','cos','tan','sigmoid','ceil','fabs','floor','trunc','cbrt',"modulox"),
	6: ('sigmoid','and','or','xor','abs','add','mul','div','sub','hypot','heaviside')
}

paramsecho = """
			1 - Simple
			2 - Total
			3 - Geometrie
			4 - Statistique
			5 - Avance
			6 - Cell
			"""


def recherche():
	sizepop = int(input("Taille de la population?: "))
	numbergen = int(input("Nombre de generation?: "))
	stpcrit = float(input("Critere d'arret de l'experience?: "))
	njobs = int(input("Nombre de processus paralleles?: "))
	if njobs>1:
		verboz = 2
	else:
		verboz = 1

	print ("Ajuster les paramètres secondaires?(O/N): ")
	ajustother = input().lower()
	if ajustother == "o":
		try:
			crossover = float(input("p_crossover[0.7]: "))
		except ValueError:
			crossover = 0.7

		try:
			subtreemutation = float(input("p_subtree_mutation[0.1]: "))
		except ValueError:
			subtreemutation = 0.1

		try:
			hoistmutation = float(input("p_hoist_mutation[0.05]: "))
		except ValueError:
			hoistmutation = 0.05

		try:
			pointmutation = float(input("p_point_mutation[0.1]: "))
		except ValueError:
			pointmutation = 0.1

		try:
			maxsamples = float(input("max_samples[0.9]: "))
		except ValueError:
			maxsamples = 0.9

		try:
			parsimonycoefficient = float(input("parsimony_coefficient[0.01]: "))
		except ValueError:
			parsimonycoefficient = 0.01

		try:
			randomstate = int(input("random_state[0]: "))
		except ValueError:
			randomstate = 0


	else:
		warmstart=False
		crossover=0.7
		subtreemutation=0.1
		hoistmutation=0.05
		pointmutation=0.1
		maxsamples=0.9
		verboz=1
		parsimonycoefficient=0.01
		randomstate=0

	parammath = int(input("\n"+paramsecho+"\nParametre de calcul a utiliser?: "))
	#parammathdict[parammath]

	gp = GP.GP_SymReg(sizepop, numbergen, stpcrit, parammathdict[parammath], False, 
			crossover, subtreemutation, hoistmutation, pointmutation, maxsamples,
			verboz, parsimonycoefficient, randomstate, njobs)

	print("Fichier CSV contenant les données a traiter?: ")
	namef1 = input()

	gp.load_csv(namef1)
	print("Le traitement va commencer...")
	gp.learn()
	namef2 = str(namef1.split(".")[0])
	print("Programme termine!")
	gp.save(namef2+".model")
	print("Sauvegarde du programme....")
	idiotstr = str(gp.get_program())
	print(idiotstr)
	nbx = gp.nbX
	GP.to_texpng(namef2+".png", nbx, idiotstr)
	print("Voici le programme: ")
	gp.print_program()

	verifier(namef1,namef2+".model")

"""
shared_total, shared_yes = 0, 0
shared_posofytokill = 0
shared_pathofmodel = ""
def shared_verifier(pathofcsv,pathofmodel,n_worker=2):
	shared_pathofmodel = pathofmodel

	f = open(pathofcsv,'r')
	DATA = f.read().split('\n')
	#shared_posofytokill = 0
	shared_posofytokill = DATA[0].split(',').index('y')
	shared_yes, shared_total = 0, 0
	print("Verification avec multi-thread du model face aux donnees en cours...")
	with Pool(int(n_worker)) as p:
		p.map(multi_part_verifier, [i for i in DATA[1:]])

	print("Programme précis à: "+str(shared_yes/(shared_total*1.00)*100.00)+" % (selon les données)")

def multi_part_verifier(i):
	gp = GP.GP_SymReg(500,100,0.01)
	gp.load(shared_pathofmodel)
	famousY = i.split(",")[shared_posofytokill]
	#print("START:",i)
	truc = i.split(",")
	yy = truc.pop(shared_posofytokill)
	IN = ",".join(truc)

	z = ''.join(c for c in IN if (c.isdigit() or c==","))
	z = z.split(",")
	z = list(map(float, z))
	#print("Resultat: ", str(gp.predict(z)))
	if int(gp.predict(z)) == int(famousY):
		shared_yes+=1
	shared_total+=1
	print("Programme précis à: "+str(shared_yes/(shared_total*1.00)*100.00)+" % (selon les données)")
"""

def extraire_prog(pathofmodel):
	gp = GP.GP_SymReg(500,100,0.01)
	gp.load(pathofmodel)
	print("Voici le programme: ")
	gp.print_program()

def tolatek(pathofimage="tmp.png"):
	gp = GP.GP_SymReg(500,100,0.01)
	gp.load(pathofmodel)
	GP.force_totex(pathofimage,str(gp.get_program()))

def verifier(pathofcsv,pathofmodel):
	gp = GP.GP_SymReg(500,100,0.01)
	gp.load(pathofmodel)

	f = open(pathofcsv,'r')
	DATA = f.read().split('\n')
	#posofytokill = 0
	posofytokill = DATA[0].split(',').index('y')
	yes, total = 0, 0
	for i in DATA[1:]:
		print((total/len(DATA[1:])*1.00)*100.0, "%")
		if i.count(",") == 0:
			break
		famousY = i.split(",")[posofytokill]
		#print("START:",i)
		truc = i.split(",")
		yy = truc.pop(posofytokill)
		IN = ",".join(truc)
		#print("OUT:", IN)
		if len(IN)==0:
			break
		else:
			z = ''.join(c for c in IN if (c.isdigit() or c==","))
			z = z.split(",")
			z = list(map(float, z))
			#print("Resultat: ", str(gp.predict(z)))
			if int(gp.predict(z)) == int(famousY):
				yes+=1
			total+=1
	print("Programme précis à: "+str(yes/(total*1.00)*100.00)+" % (selon les données)")


def amener():
	gp = GP.GP_SymReg(500,100,0.01)
	namef = input("Nom du fichier model: ")
	gp.load(namef)

	while (True):
		IN = input("Veuillez entrer les données de prédiction: ")
		if len(IN)==0:
			break
		else:
			z = ''.join(c for c in IN if (c.isdigit() or c==","))
			z = z.split(",")
			z = map(float, z)
			print("Resultat: ", str(gp.predict(z)))

while(True):
	print("Que voulez vous faire ?\n1 - Faire une experience\n2 - Faire des predictions\n3 - Tester un model\n4 - Extraire un programme d'un model\n5 - Sauvegarder une image LaTex d'un model")
	choix = input("CHOIX> ") 
	if int(choix) == 1:
		recherche()
	elif int(choix) == 2:
		amener()
	elif int(choix) == 3:
		print("Fichier CSV contenant les données a traiter?: ")
		namef1 = input()
		print("Fichier model contenant le programme a traiter?: ")
		namef2 = input()
		verifier(namef1,namef2)
	elif int(choix) == 4:
		print("Fichier model contenant le programme a extraire?: ")
		namef2 = input()
		extraire_prog(namef2)
	elif int(choix) == 5:
		tolatek()
		print("Image sauvegardée !")
	else:
		print("CHOIX FAUX!")

"""
elif int(choix) == 4:
	print("Fichier CSV contenant les données a traiter?: ")
	namef1 = input()
	print("Fichier model contenant le programme a traiter?: ")
	namef2 = input()
	print("Nombre de worker?: ")
	n_work = input()
	shared_verifier(namef1,namef2,n_work)
"""


