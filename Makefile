# compile with gcc
COMPILER = gcc

# The C flags to pass to gcc
C_FLAGS = -Wall -Wextra -g -std=c99

# prepend the command with '@' so that Make does not print the command before running it 
help:
	@printf "available command:\n"
	@printf "	make help               (this command)\n"
	@printf "	make LinkedList          (to build your C program)\n"
	@printf "	make test               (to run every test case)\n"

# link our .o files to make an executable
LinkedList: LinkedList.o
	$(COMPILER) $(C_FLAGS) -o LinkedList LinkedList.o 

# compile the `Stack.o` file
LinkedList.o: LinkedList.c
	$(COMPILER) $(C_FLAGS) -c LinkedList.c

##################################################################
# Test Cases
test: test1 test2 test3

# run our executable by passing in the text file via stdin with `<` and passing stdout to a file with `>`
# then use a scrit to verify that the result are the same one as the one expected
test1: LinkedList Data/test1.input Data/test1.expected
	./LinkedList < Data/test1.input > test1.result
	./TestPassed.sh test1.result Data/test1.expected

test2: LinkedList Data/test2.input Data/test2.expected
	./LinkedList < Data/test2.input > test2.result
	./TestPassed.sh test2.result Data/test2.expected

test3: LinkedList Data/test3.input Data/test3.expected
	./LinkedList < Data/test3.input > test3.result
	./TestPassed.sh test3.result Data/test3.expected
# TODO: add targets to compile LinkedList.c

# TODO: add a target for each .input file in the Data directory to run the compiled LinkedList program with the tests in ./Data

# TODO: add a target that can run all the tests above.