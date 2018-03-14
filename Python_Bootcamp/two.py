# two.py

import one
print "TOP LEVEL IN ONE.PY"

one.func()

if __name__ == '__main__':
    print "TWO.PY IS RAN DIRECTLY"
else:
    print "TWO.PY IS BEING IMPORTED"
