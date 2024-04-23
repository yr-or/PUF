from scipy.spatial.distance import hamming
import numpy as np

responses = [
	"feefa7fe5efff9cf",
	"7fffdffdfbedffbd",
	"9d10829e82ea15e2",
	"fdeffffffffffbff",
	"81150000042424d1",
	"feefbfff7fffbb5f",
	"779b5d59aac32698",
	"abff2f7d7f64b53d",
	"6706f739dfcddfd7",
	"9ce8b2ff177eb9db"]


resps_hex = [int(a, 16) for a in responses]
for i in range(len(resps_hex)):
	val = resps_hex[i]
	#print(bin(val))

# Convert to strings
resps_bin_strs = [bin(b)[2:] for b in resps_hex]
# Make sure length is 16
for i in range(len(resps_bin_strs)):
	st = resps_bin_strs[i]
	len_def = 64 - len(st)
	if len_def > 0:
		resps_bin_strs[i] = '0'*len_def + st
	#print(resps_bin_strs[i])

resps_bin_array = [[int(bit) for bit in stri] for stri in resps_bin_strs]
#print(resps_bin_array)

# Calculate uniqueness
k = 10
n = 64
acc = 0
for i in range(0,k):
	for j in range(i+1, k):
		acc = acc + (hamming(resps_bin_array[i], resps_bin_array[j])/64)*100

uniqueness = acc * (2/(k*(k-1)))
print(uniqueness)

# Uniformity
uniformity_arr = []
for i in range(10):
	sum_b = 0
	for j in range(64):
		sum_b += int(resps_bin_strs[i][j])
	uniformity_i = (1/n)*sum_b*100
	uniformity_arr.append(uniformity_i)

print(uniformity_arr)
print("average uniformity:", np.mean(uniformity_arr))