#coding: utf-8
"""
Genetic Programming Complete Tool for Scientific Research in Mathematics
GPCTSCRM
"""
__version__ = "1.1.parsed"

import gplearn.GP as GP

print "Bienvenue dans GPCT-SRM Predict v"+ __version__ 

parammathdict = {
	1: ('add','sub','mul','div'),
	2: "all",
	3: ('add','sub','mul','div','hypot','sin','cos','tan'),
	4: ('add','sub','mul','div','max','min','abs'),
	5: ('add','sub','mul','div','sqrt','log','abs','neg','inv','sin','cos','tan','sigmoid','ceil','fabs','floor','trunc','cbrt',"modulo")
}
paramsecho = """
			1 - Simple
			2 - Total
			3 - Geometrie
			4 - Statistique
			5 - Avance
			"""
import argparse
parser = argparse.ArgumentParser()
parser.add_argument('namemodel')
parser.add_argument('datapredict')
args = parser.parse_args()


def amener():
	gp = GP.GP_SymReg(500,100,0.01)
	namef = args.namemodel#raw_input("Nom du fichier model: ")
	gp.load(namef)

	while (True):
		IN = args.datapredict#raw_input("Veuillez entrer les données de prédiction: ")
		if len(IN)==0:
			break
		else:
			z = ''.join(c for c in IN if (c.isdigit() or c==","))
			z = z.split(",")
			z = map(float, z)
            f = open("outlogpred.txt","w")
            f.write("Resultat: " + str(gp.predict(z)))
            f.close()
			print "Resultat: ", str(gp.predict(z))


amener()






