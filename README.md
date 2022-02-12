# openVINO-inference-environment-on-32bitRaspberryPiOS
Procedure for building openVINO inference environment on 32bit Raspberry Pi OS



## **Physical specifications**

#### **RaspberryPi**
Hardware: BCM2711  
Model: Raspberry Pi 4 Model B Rev 1.2  
microSD card: 32GB or more

#### **Inference accelerator**
Intel NCS2 Neural Compute Stick 2  
<br>
<br />

## **Development environment**
#### **RaspberryPi**
Kernel: Linux    
Kernel release No.: 5.10.92-v8+   
Kernel version: #1496 SMP Wed Dec 1 15:58:56 GMT 2021 armv7l    
OS： Raspbian GNU/Linux 10 (buster)  
Language: python 3.7.2  
<br/>

## **Construction procedure**

### **Preparation**
1.  Prepare RaspberryPi OS image disc.  https://www.raspberrypi.com/software/
2. Insert the OS image disc into the Raspberry Pi and turn on the power.
3. Make initial settings for Raspberry Pi, ssh/VNC available and connect to the Internet.  
<br>

### **Building an environment on Raspberry Pi**
Start Raspberry so that it can connect to VNC and connect to the Internet.  
  
Clone this project from public repository
```sh  
git clone https://github.com/nsaito9628/openVINO-inference-environment-on-32bitRaspberryPiOS.git
```
  
Deploy a project  
``` sh
cp ./openVINO-inference-environment-on-32bitRaspberryPiOS/*.sh ~
cp ./openVINO-inference-environment-on-32bitRaspberryPiOS/sample/* ~
```

Download and unpack the required packages
```sh
sudo chmod u+x environment.sh
./environment.sh
```
  
Insert NCS2 stick  
<br>
### **Confirmation of human detection operation**
```sh  
source /opt/intel/openvino/bin/setupvars.sh
echo "source /opt/intel/openvino/bin/setupvars.sh" >> ~/.bashrc

sudo usermod -a -G users "$(whoami)"
sh /opt/intel/openvino/install_dependencies/install_NCS_udev_rules.sh

python3 object_detection_demo_ssd_async.py -i cam -d MYRIAD -pt 0.4 -m ./person-vehicle-bike-detection-crossroad-0078.xml
```


