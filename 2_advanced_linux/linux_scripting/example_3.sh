~1/bin/sh
# Calling one func from another
func_one() {
	echo "This is the first function speaking..."
	func_two
}
func_two () {
	echo "This is now the second function..."
}

# Calling function 1
func_one
