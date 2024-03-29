import random

for i in range(8):
	for j in range(4):
		print( str(hex(random.randint(0,15)))[2:].upper(), end="" )
	if i != 7:
		print("_", end="")
	else:
		print()

print("FFFF_"*4)
print("0000_"*4)
