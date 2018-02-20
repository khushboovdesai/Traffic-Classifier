define ($IP 10.10.1.1)  
define ($MAC 00:00:00:00:01:00)  

source::FromDevice;  
sink::ToDevice;  

c::Classifier(  

//APPLICATION LAYER PROTOCOLS

	36/0050, 		//HTTP Request
	34/0050,		//HTTP Response
	36/075b,		//MQTT Message Request
	34/075b,		//MQTT Message Request
	36/0035, 		//DNS Query  
	34/0035, 		//DNS Response  
	282/3501, 		//DHCP Protocol type 
	26/1628,		//AMQP Message Request
	24/1628,		//AMQP Message Response

//TRANSPORT LAYER PROTOCOLS

	23/11, 			//UDP Protocol Type over IPv4
	23/06, 			//TCP Protocol Type over IPv4

//NETWORK LAYER PROTOCOLS

	12/0080,		//IPv4 Packet type
	23/01,	 		//ICMP Protocol Type over IPv4 

//LINK LAYER PROTOCOLS

	12/0806 20/0001, 	//ARP request  
	12/0806 20/0002, 	//ARP response
	
	-);  

source->c;  
	
c[0]->Print('HTTP Request Packet')->sink;  
c[1]->Print('HTTP Response Packet')->sink;  
c[2]->Print('MQTT Message Request Packet')->sink;  
c[3]->Print('MQTT Message Response Packet')->sink;  
c[4]->Print('DHCP Packet')->sink;  
c[5]->Print('DNS Query Packet')->sink;  
c[6]->Print('DNS Response Packet')->sink;  
c[7]->Print('AMQP Message Request Packet')->sink;  
c[8]->Print('AMQP Message Response Packet')->sink;  
c[9]->Print('UDP Packet over IPv4')->sink;  
c[10]->Print('TCP Packet over IPv4')->sink;  
c[11]->Print('IPv4 Packet')->sink;  
c[12]->Print('ICMP over IPv4 Packet')->sink;  
c[13]->Print('ARP Request Packet')->sink;  
c[14]->Print('ARP Response Packet')->sink;  
c[15]->Print('Others')->Discard;
