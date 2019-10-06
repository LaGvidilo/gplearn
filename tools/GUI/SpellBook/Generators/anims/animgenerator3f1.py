#coding: utf-8
#for python3
from PIL import Image, ImageDraw, ImageFont
import random
import os
import numpy as np
from copy import deepcopy


def nomore(x,ztepx):
	if (x > ztepx):
		return ztepx
	else:
		return x

infile="pentacle_.png"
img=Image.open(infile).convert('RGBA')
(l, h) = img.size

try:
	os.mkdir("logo-pentacle3/")
except:
	pass

f=open("filesanim3f1.txt","w")
for c1 in map(int,np.arange(255,0,-1)):
	imageA = Image.new('RGBA', (l, h))
	for y in range(0,h):
		for x in range(0,l):
			r,g,b,a = img.getpixel((x, y))
			r,g,b = r%c1,g%c1,b%c1
			imageA.putpixel((x, y), (r,g,b,a))
	imageA.save("logo-pentacle3/"+"A3-"+str(c1)+".png" , "PNG")
	f.write("A3-"+str(c1)+".png\n")
	print(str(c1)+" ;")

f.close()

"""

i.getpixel((x, y))
i.putpixel((x, y), (r,g,b))
i.save(outfile, "PNG")
"""