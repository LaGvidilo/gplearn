#coding: utf-8

class translateFunctions:
	def __init__(self,funct, kwargs):
		for k,v in kwargs.items():
			exec(str(k)+"=0")
			exec(str(k)+"="+str(v))
		replacetok = [["cbrt(","self.cbrt("],["hypot(","self.hypot("],["sigmoid(","self.sigmoid("],["ceil(","self.ceil("],["fabs(","self.fabs("],["floor(","self.floor("],["trunc(","self.trunc("],["sub(","self.sub("],["add(","self.add("],["mul(","self.mul("],["div(","self.div("],["sqrt(","self.sqrt("],["log(","self.log("],["abs(","self.abs("],["neg(","self.neg("],["inv(","self.inv("],["max(","self.max("],["min(","self.min("],["sin(","self.sin("],["cos(","self.cos("],["tan(","self.tan("],["modulox(","self.modulox("],["xor(","self.xor("],["or(","self.or("],["and(","self.and("],["heaviside(","self.heaviside("],["zegax(","self.zegax("],["moyenne2(","self.moyenne2("],["moyenne3(","self.moyenne3("],["moyenne4(","self.moyenne4("],["moyenne5(","self.moyenne5("],["moyenne6(","self.moyenne6("],["moyenne7(","self.moyenne7("],["moyenne8(","self.moyenne8("],["moyenne9(","self.moyenne9("],["moyenne10(","self.moyenne10("],["moyenne(","self.moyenne("]]
		for i in replacetok:
			funct = funct.replace(i[0],i[1])
		exec("self.y="+funct)
	def getter(self):
		return self.y
	def cbrt(self,a):
		return "cbrt("+str(a)+")"
	def hypot(self,a,b):
		return "hypot("+str(a)+","+str(b)+")"
	def sigmoid(self,a):
		return "sigmoid("+str(a)+")"
	def ceil(self,a):
		return "ceil("+str(a)+")"
	def fabs(self,a):
		return "fabs("+str(a)+")"
	def floor(self,a):
		return "floor("+str(a)+")"
	def trunc(self,a):
		return "trunc("+str(a)+")"
	def sub(self,a,b):
		return "("+str(a)+"-"+str(b)+")"
	def add(self,a,b):
		return "("+str(a)+"+"+str(b)+")"
	def mul(self,a,b):
		return "("+str(a)+"*"+str(b)+")"
	def div(self,a,b):
		return "("+str(a)+"/"+str(b)+")"
	def sqrt(self,a):
		return "sqrt("+str(a)+")"
	def log(self,a):
		return "log("+str(a)+")"
	def abs(self,a):
		return "abs("+str(a)+")"
	def neg(self,a):
		return "neg("+str(a)+")"
	def inv(self,a):
		return "inv("+str(a)+")"
	def max(self,a,b):
		return "max("+str(a)+","+str(b)+")"
	def min(self,a,b):
		return "min("+str(a)+","+str(b)+")"
	def sin(self,a):
		return "sin("+str(a)+")"
	def cos(self,a):
		return "cos("+str(a)+")"
	def tan(self,a):
		return "tan("+str(a)+")"
	def modulox(self,a,b):
		return "modulox("+str(a)+","+str(b)+")"
	def xor(self,a,b):
		return "xor("+str(a)+","+str(b)+")"		
	def or_(self,a,b):
		return "or("+str(a)+","+str(b)+")"	
	def and_(self,a,b):
		return "and("+str(a)+","+str(b)+")"	
	def heaviside(self,a,b):
		return "heaviside("+str(a)+","+str(b)+")"
	def zegax(self,a,b):
		return "zegax("+str(a)+","+str(b)+")"
	def moyenne2(self,a,b):
		return "mean("+",".join(map(str,[a,b]))+")"
	def moyenne3(self,a,b,c):
		return "mean("+",".join(map(str,[a,b,c]))+")"
	def moyenne4(self,a,b,c,d):
		return "mean("+",".join(map(str,[a,b,c,d]))+")"
	def moyenne5(self,a,b,c,d,e):
		return "mean("+",".join(map(str,[a,b,c,d,e]))+")"
	def moyenne6(self,a,b,c,d,e,f):
		return "mean("+",".join(map(str,[a,b,c,d,e,f]))+")"
	def moyenne7(self,a,b,c,d,e,f,g):
		return "mean("+",".join(map(str,[a,b,c,d,e,f,g]))+")"
	def moyenne8(self,a,b,c,d,e,f,g,h):
		return "mean("+",".join(map(str,[a,b,c,d,e,f,g,h]))+")"
	def moyenne9(self,a,b,c,d,e,f,g,h,j):
		return "mean("+",".join(map(str,[a,b,c,d,e,f,g,h,j]))+")"
	def moyenne10(self,a,b,c,d,e,f,g,h,j,k):
		return "mean("+",".join(map(str,[a,b,c,d,e,f,g,h,j,k]))+")"
	def moyenne(self,*argu):
		return "mean("+",".join(map(str,argu))+")"

#exemple
tsf = translateFunctions("moyenne(moyenne(div(div(div(X1, X0), hypot(X1, div(X1, X0))), tan(hypot(-0.549, -0.102))), mul(hypot(X0, X0), mul(hypot(mul(hypot(X0, X0), mul(hypot(X0, div(mul(div(mul(hypot(X0, X0), mul(hypot(mul(hypot(X0, X0), mul(hypot(X0, div(mul(sin(X0), mul(hypot(mul(-0.102, sin(X1)), div(div(X1, X0), hypot(X1, X1))), div(div(div(hypot(X0, mul(hypot(X0, X0), hypot(-0.549, -0.102))), X0), hypot(hypot(-0.549, -0.102), div(X0, X0))), hypot(X1, X1)))), hypot(mul(hypot(X0, hypot(-0.549, -0.102)), hypot(tan(hypot(div(hypot(-0.549, -0.102), tan(tan(sub(X0, -0.161)))), -0.191)), -0.102)), X1))), tan(hypot(-0.549, -0.102)))), div(div(X1, X0), hypot(X1, X1))), tan(hypot(-0.549, -0.102)))), hypot(X1, X1)), mul(hypot(mul(-0.102, sin(X1)), div(hypot(X0, mul(hypot(X0, X0), hypot(-0.549, -0.102))), hypot(X1, X1))), div(div(div(X1, X0), hypot(X1, div(X1, X0))), hypot(X1, X1)))), hypot(X1, hypot(X0, mul(X1, X0))))), tan(hypot(-0.549, -0.102)))), div(div(X1, X0), hypot(X1, X1))), tan(hypot(-0.549, -0.102))))), mul(hypot(X0, X0), mul(hypot(X0, mul(hypot(X0, X0), hypot(-0.549, -0.102))), hypot(tan(hypot(-0.549, -0.102)), -0.102))))",{'X0':4,'X1':2})
print (tsf.getter())
