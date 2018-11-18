all: network1

seminar1:
	./dlv seminar_test1.dl seminar_guess.dl seminar_check.dl -filter=reserved

seminar2:
	./dlv seminar_test2.dl seminar_guess.dl seminar_check.dl -pfilter=reserved

seminar3:
	./dlv seminar_test3.dl seminar_guess.dl seminar_check.dl -pfilter=reserved

seminar4:
	./dlv seminar_test4.dl seminar_guess.dl seminar_check.dl -pfilter=reserved

seminar5:
	./dlv seminar_test5.dl seminar_guess.dl seminar_check.dl -pfilter=reserved

network1:
	./dlv -N=2 network.dl network_test1.dl test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network2:
	./dlv -N=2 network.dl network_test2.dl test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network3:
	./dlv -N=2 network.dl network_test3.dl test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network4:
	./dlv -N=2 network.dl network_test4.dl test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network5:
	./dlv -N=2 network.dl network_test5.dl test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network6:
	./dlv -N=2 network.dl network_test6.dl test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network7:
	./dlv -N=2 network.dl network_test7.dl test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network8:
	./dlv -N=2 network.dl network_test8.dl test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network6-cbd:
	./dlv -N=2 -FRmin -silent network.dl cbd.hyp cbd_cstr.dl network_test6.obs

network-cbd:
	./dlv -N=2 -FRmin -silent network.dl cbd.hyp cbd_cstr.dl cbd_fault.obs cbd_fault_m1_ok.obs
	./dlv -N=2 -FRsingle -silent network.dl cbd.hyp cbd_cstr.dl cbd_fault.obs cbd_fault_m1_ok.obs
	./dlv -N=2 -FR -silent network.dl cbd.hyp cbd_cstr.dl cbd_fault.obs cbd_fault_m1_ok.obs

network-fault-c1-ab:
	./dlv -N=2 -FRsingle -silent network.dl cbd.hyp cbd_cstr.dl cbd_fault.obs cbd_fault_c1_ab.obs

network-fault-m1m2-ab:
	./dlv -N=2 -FRmin -silent network.dl cbd.hyp cbd_cstr.dl cbd_fault.obs cbd_fault_m1m2_ab.obs

network-abd:
	./dlv -N=2 -FD -silent abd_network.dl abd.hyp abd_cstr.dl abd_fault.dl abd_fault.obs