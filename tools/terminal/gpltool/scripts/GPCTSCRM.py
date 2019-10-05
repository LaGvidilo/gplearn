#coding: utf-8
"""
Genetic Programming Complete Tool for Scientific Research in Mathematics
GPCTSCRM
"""
__version__ = "1.1.parsed"

import GP

print "Bienvenue dans GPCT-SRM v"+ __version__ 

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

parser = argparse.ArgumentParser()
parser.add_argument('sizepop')
parser.add_argument('numbergen')
parser.add_argument('stpcrit')
parser.add_argument('njobs')
parser.add_argument('crossover')
parser.add_argument('subtreemutation')
parser.add_argument('hoistmutation')
parser.add_argument('pointmutation')
parser.add_argument('maxsamples')
parser.add_argument('parsimonycoefficient')
parser.add_argument('csvfile')
parser.add_argument('parammath')
args = parser.parse_args()

def recherche():
	sizepop = args.sizepop#input("Taille de la population?: ")
	numbergen = args.numbergen#input("Nombre de generation?: ")
	stpcrit = args.stpcrit#input("Critere d'arret de l'experience?: ")
	njobs = args.njobs#input("Nombre de processus paralleles?: ")
	if njobs>1:
		verboz = 2
	else:
		verboz = 1

	#Paramètres secondaires
	crossover = args.crossover#input("p_crossover: ")
	subtreemutation = args.subtreemutation#input("p_subtree_mutation: ")
	hoistmutation = args.hoistmutation#input("p_hoist_mutation: ")
	pointmutation = args.pointmutation#input("p_point_mutation: ")
	maxsamples = args.maxsamples#input("max_samples: ")
	parsimonycoefficient = args.parsimonycoefficient#input("parsimony_coefficient: ")
	randomstate = args.randomstate#input("random_state: ")

	"""
		warmstart=False
		crossover=0.7
		subtreemutation=0.1
		hoistmutation=0.05
		pointmutation=0.1
		maxsamples=0.9
		verboz=1
		parsimonycoefficient=0.01
		randomstate=0
	"""

	parammath = args.parammath#input("\n"+paramsecho+"\nParametre de calcul a utiliser?: ")
	#parammathdict[parammath]

	gp = GP.GP_SymReg(sizepop, numbergen, stpcrit, parammathdict[parammath], False, 
			crossover, subtreemutation, hoistmutation, pointmutation, maxsamples,
			verboz, parsimonycoefficient, randomstate, njobs)

	#print "Fichier CSV contenant les données a traiter?: ",
	namef1 = args.csvfile#raw_input()

	gp.load_csv(namef1)
	print "Le traitement va commencer..."
	gp.learn()
	namef2 = str(namef1.split(".")[0])
	print "Programme termine!"
	gp.save(namef2+".model")
	print "Sauvegarde du programme..."
	idiotstr = "y="+str(gp.get_program())
	print idiotstr
	nbx = gp.nbX
	GP.to_texpng(namef2+".png", nbx, idiotstr)
	print "Voici le programme: ", gp.print_program()

recherche()




