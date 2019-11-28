#coding: utf-8
"""
Genetic Programming Complete Tool for Scientific Research in Mathematics

"""
__version__ = "1.1.0000"

import gplearn.GP as GP

print("Bienvenue dans GPCT-SRM v"+ __version__)

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
		crossover = float(input("p_crossover: "))
		subtreemutation = float(input("p_subtree_mutation: "))
		hoistmutation = float(input("p_hoist_mutation: "))
		pointmutation = float(input("p_point_mutation: "))
		maxsamples = float(input("max_samples: "))
		parsimonycoefficient = float(input("parsimony_coefficient: "))
		randomstate = int(input("random_state: "))
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
	print("Sauvegarde du programme...")
	idiotstr = "y="+str(gp.get_program())
	print(idiotstr)
	nbx = gp.nbX
	GP.to_texpng(namef2+".png", nbx, idiotstr)
	print("Voici le programme: ", gp.print_program())

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
	print("Que voulez vous faire ?\n1 - Faire une experience\n2 - Faire des predictions")
	choix = input("CHOIX> ") 
	if int(choix) == 1:
		recherche()
	if int(choix) == 2:
		amener()
	else:
		print("CHOIX FAUX!")





