# Processing Vit's Booter Attack Data

I found a paper "[Bukac, V., Stavova, V., Nemec, L., Riha, Z., & Matyas, V. (2015). Service in Denial - Clouds Going with the Winds. In Network and System Security (NSS)](http://crcs.cz/wiki/lib/exe/fetch.php?media=public:research:serviceindenial.pdf)" and contact the first author, [Viteg](https://github.com/Vieteg), to use their data. The guy was awesome and very helpfull in the understanding of the data (Thanks Vit). The goal of this repository is to describe what I did with the data.

1. I download the data ([Links](https://github.com/crocs-muni/ddos-vault/blob/master/DDoSaaSTraces))
2. I discovered (thanks to Viteg) that the target IP instead of '54.68.6.47' (written in the metadata) it is '172.31.28.132'
3. I filtered each pcap file 'dst host 172.31.28.132 and not src net 172.31.0.0/16' to reduce the amount of data
4. I parser the data to a format to be processed in a hadoop cluster with Apache Pig using a [simple very tool](https://github.com/jjsantanna/ddos_filtering_tool_v2/blob/master/conversion/pcap2jtrace.py).
5. I process the converted traffic using [some Pig scripts](https://github.com/jjsantanna/ddos_filtering_tool_v2/tree/master/processing)
6. I used [a bash script](https://github.com/jjsantanna/processing_vit_booter_attacks/blob/master/vit_attack_blaming.sh) to add the name of the Booter utilized to perform attack into the processed summarized information 

The final result I will put into http://ddosdb.org that is an initiative to collect and publicly share DDoS attack information
