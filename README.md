# Processing Vit Bukac Booter Attack Data

I found a paper "Bukac, V., Stavova, V., Nemec, L., Riha, Z., & Matyas, V. (2015). Service in Denial - Clouds Going with the Winds. In Network and System Security (NSS)" and contact the first author, Vit (https://github.com/Vieteg), to use their data. The guy was awesome and very helpfull in the understanding of the data (Thanks Vit). The goal of this repository is to describe what I did with the data.

1) I download the data. Links in https://github.com/crocs-muni/ddos-vault/blob/master/DDoSaaSTraces
2) I discovered (thanks to Vit) that the target IP instead of '54.68.6.47' (written in the metadata) it is '172.31.28.132'
3) I filtered each pcap file 'dst host 172.31.28.132 and not src net 172.31.0.0/16' to reduce the amount of data
4) I parser the data using to a better format to process in a hadoop cluster with Apache Pig (https://github.com/jjsantanna/ddos_filtering_tool_v2/blob/master/conversion/pcap2jtrace.py)
5) I process the converted traffic using the scripts in https://github.com/jjsantanna/ddos_filtering_tool_v2/tree/master/processing
6) I added to the processed summarized information the name of the Booter utilized to perform attack (blame) (https://github.com/jjsantanna/processing_vit_booter_attacks/blob/master/vit_attack_blaming.sh)
