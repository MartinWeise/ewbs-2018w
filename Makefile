all: seminar2

seminar1:
	./dlv seminar_test1.dl seminar_guess.dl seminar_check.dl -pfilter=reserved

seminar2:
	./dlv seminar_test2.dl seminar_guess.dl seminar_check.dl -pfilter=reserved

seminar3:
	./dlv seminar_test3.dl seminar_guess.dl seminar_check.dl -pfilter=reserved

seminar4:
	./dlv seminar_test4.dl seminar_guess.dl seminar_check.dl -pfilter=reserved

seminar5:
	./dlv seminar_test5.dl seminar_guess.dl seminar_check.dl -pfilter=reserved