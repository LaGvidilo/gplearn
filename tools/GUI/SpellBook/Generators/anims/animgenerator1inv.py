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
	os.mkdir("pentacle_animated_inv"+infile.split(".")[0])
except:
	pass

f=open("filesanim1inv.txt","w")
for c1 in range(0,360):
	newimg = img.rotate(360-c1)
	newimg.save("pentacle_animated_inv"+infile.split(".")[0]+"/img"+str(c1)+".png" , "PNG")
	f.write("pentacle_animated_inv"+infile.split(".")[0]+"/img"+str(c1)+".png\n")
	print(str(c1)+" ;")

f.close()

"""

i.getpixel((x, y))
i.putpixel((x, y), (r,g,b))
i.save(outfile, "PNG")
"""