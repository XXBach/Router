# Router
Router Design, Basic SV testbench and more advance SV testbench
# Design Idea
The picture below shows the idea of Router Design
![router_alt](https://github.com/XXBach/Router/blob/main/Pictures%20and%20docs/Router.png)

The router has 16 input and 16 output ports. Each input and output port consists of 3 signals, serial data, frame and valid. These signals are represented in a bit-vector format, din[15:0], frame_n[15:0], valid_n[15:0], dout[15:0], frameo_n[15:0] and valido_n[15:0].

To drive an individual port, the specific bit position corresponding to the port number must be specified. For example, if input port 3 is to be driven, then the corresponding signals shall be din[3], frame_n[3] and valid_n[3].

To sample an individual port, the specific bit position corresponding to the port number must be specified. For example, if output port 7 is to be sampled, then the corresponding signals shall be dout[7], frameo_n[7] and valido_n[7].

Therefore, each Port will have a controller and a cell to receive/sampling datas.

To route it correctly, each Input Port will send a vector of request_to_port_x ( implies that Input Port X require Output Ports Y to set connection ), these signals go through a matrix to map out input signal request_for_port_y for Output Ports ( implies that Output Port Y receive requests from Input Ports X ). After Output Port decide which Input Port to set connection with, it will then send another vector of signal, these signal will be remap follow the previous way.

# Basic Testbench
The pỉcture below shows the idea of Basic Testbench, which is written in Test.sv.
![Test_alt](https://github.com/XXBach/Router/blob/main/Pictures%20and%20docs/Test_sv.png)

Image shows various tasks and functions in SV testbench like Drive, Generate, etc. 

In Test.sv, these tasks and functions are written in 1 single file and 1 single module called Test and are executed concurrently.
# More Advanced Testbench
The image below shows the idea of Advanced Testbench, which is written in test_advanced_tb.sv.
![test_advanced_alt](https://github.com/XXBach/Router/blob/main/Pictures%20and%20docs/test_advanced_tb.png)

This image took a resemblance with the previous one about the tasks that used in SV testbench

However, the image show that each task now designed into classes, which takes full advantage of SV by using 4 elements of OOP in SV

Each classes in the testbench have their own task, run on there own thread and communicate to each other by using mailbox and semaphore

Unfortunately I don't have enough time to fully design and run the advanced testbench
