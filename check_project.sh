#!/usr/bin/env bash

#Copyright (c) 2018 Lukas Grassauer

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.


DLV_PATH="${1:-./dlv}"

PROJECT_DIR="${2:-project}"

TEST_SEPERATOR="\n"

TESTCASE=1

function increment_testcase(){
	TESTCASE=$((TESTCASE+1))
}

RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
END=$'\e[0m'

for i in {1..8}
do
	printf "Test $TESTCASE:  "
	ACTUAL="$(${DLV_PATH} -FRmin -silent -N=2 ${PROJECT_DIR}/network.dl ${PROJECT_DIR}/cbd.hyp ${PROJECT_DIR}/cbd_cstr.dl ${PROJECT_DIR}/network_test$i.obs)"
	if [ "$ACTUAL" == "Diagnosis:" ]
	then
		printf "${GREEN}✓${END}"
	else
		printf "${RED}✗${END}"
		printf " Expected: \"Diagnosis:\", Actual: \"${ACTUAL}\""
	fi
	printf "$TEST_SEPERATOR"
	increment_testcase
done



printf "Test $TESTCASE:  "
if ! ${DLV_PATH} -FRmin -silent -N=2 ${PROJECT_DIR}/network.dl ${PROJECT_DIR}/cbd.hyp ${PROJECT_DIR}/cbd_cstr.dl ${PROJECT_DIR}/cbd_fault.obs ${PROJECT_DIR}/cbd_fault_m1_ok.obs | grep -E "ab(m1)"
then
		printf "${GREEN}✓${END}"
else
	printf "${RED}✗${END}"
	printf " Should not include ab(m1)"
fi

printf "$TEST_SEPERATOR"
increment_testcase

printf "Test $TESTCASE: "
ACTUAL="$(${DLV_PATH} -FRmin -silent -N=2 ${PROJECT_DIR}/network.dl ${PROJECT_DIR}/cbd.hyp ${PROJECT_DIR}/cbd_cstr.dl ${PROJECT_DIR}/cbd_fault.obs ${PROJECT_DIR}/cbd_fault_c1_ab.obs)"
if [ "$ACTUAL" == "Diagnosis: ab(c1)" ]
then
	printf "${GREEN}✓${END}"
else
	printf "${RED}✗${END}"
	printf " Expected: \"Diagnosis: ab(c1)\", Actual: \"${ACTUAL}\""
fi
printf "$TEST_SEPERATOR"
increment_testcase

printf "Test $TESTCASE: "
ACTUAL="$(${DLV_PATH} -FRmin -silent -N=2 ${PROJECT_DIR}/network.dl ${PROJECT_DIR}/cbd.hyp ${PROJECT_DIR}/cbd_cstr.dl ${PROJECT_DIR}/cbd_fault.obs ${PROJECT_DIR}/cbd_fault_m1m2_ab.obs)"
if [ "$ACTUAL" == "Diagnosis: ab(m1) ab(m2)" ]
then
	printf "${GREEN}✓${END}"
else
	printf "${RED}✗${END}"
	printf " Expected: \"Diagnosis: ab(m1) ab(m2)\", Actual: \"${ACTUAL}\""
fi
printf "$TEST_SEPERATOR"
increment_testcase

printf "Test $TESTCASE: "
EXPECTED="$(printf "Diagnosis: ok(m1) ok(m2) ok(w1) ok(w2) wary(c1)\nDiagnosis: ok(w1) ok(w2) wary(m1) wary(m2) wary(c1)\nDiagnosis: ok(w1) ok(w2) ok(c1) wary(m1) wary(m2)\n" | sort)"
ACTUAL="$(${DLV_PATH} -silent -N=2 -FD ${PROJECT_DIR}/abd_network.dl ${PROJECT_DIR}/abd.hyp ${PROJECT_DIR}/abd_cstr.dl ${PROJECT_DIR}/abd_fault.dl ${PROJECT_DIR}/abd_fault.obs | sort)"
if [ "$ACTUAL" == "$EXPECTED" ]
then
	printf "${GREEN}✓${END}"
else
	printf "${RED}✗${END}"
	printf " Expected: \"${EXPECTED}\", Actual: \"${ACTUAL}\""
fi
printf "$TEST_SEPERATOR"
increment_testcase

printf "Test $TESTCASE: "
EXPECTED="$(printf "Diagnosis: ok(m2) ok(w1) ok(w2) wary(m1) wary(c1)\nDiagnosis: ok(m2) ok(w1) ok(w2) ok(c1) wary(m1)\n" | sort)"
ACTUAL="$(${DLV_PATH} -silent -N=2 -FD ${PROJECT_DIR}/abd_network.dl ${PROJECT_DIR}/abd.hyp ${PROJECT_DIR}/abd_cstr.dl ${PROJECT_DIR}/abd_fault.dl ${PROJECT_DIR}/abd_fault_m1_wary.obs | sort)"
if [ "$ACTUAL" == "$EXPECTED" ]
then
	printf "${GREEN}✓${END}"
else
	printf "${RED}✗${END}"
	printf " Expected: \"${EXPECTED}\", Actual: \"${ACTUAL}\""
fi
printf "$TEST_SEPERATOR"
increment_testcase

printf "Test $TESTCASE: "
EXPECTED=""
ACTUAL="$(${DLV_PATH} -silent -N=2 -FD ${PROJECT_DIR}/abd_network.dl ${PROJECT_DIR}/abd.hyp ${PROJECT_DIR}/abd_cstr.dl ${PROJECT_DIR}/abd_fault.dl ${PROJECT_DIR}/abd_fault_empty.obs | sort)"
if [ "$ACTUAL" == "$EXPECTED" ]
then
	printf "${GREEN}✓${END}"
else
	printf "${RED}✗${END}"
	printf " Expected: \"${EXPECTED}\", Actual: \"${ACTUAL}\""
fi
printf "$TEST_SEPERATOR"
increment_testcase
