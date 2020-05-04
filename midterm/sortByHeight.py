"""
Some people are standing in a row in a park. There are trees between them
which cannot be moved. Your task is to rearrange the people by their heights in a
non-descending order without moving the trees.

Example:

For a = [-1, 150, 190, 170, -1, -1, 160, 180], the output should be
sortByHeight(a) = [-1, 150, 160, 170, -1, -1, 180, 190].

"""

import time

def sortByHeight(arr):
    arr_no_tree = [ele for ele in arr if ele != -1]
    sorted_arr_no_tree = sorted(arr_no_tree)

    j = 0
    result = [i for i in arr]
    for i in range(len(arr)):
        if arr[i] == -1:
            pass
        else:
            result[i] = sorted_arr_no_tree[j]
            j += 1
    return result

a = [-1, 150, 190, 170, -1, -1, 160, 180]

result = sortByHeight(a)
print("a:      {}".format(a))
print("result: {}".format(result))