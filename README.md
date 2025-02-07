# ns2-windows-linux
In this repo I am going to explain how to install and run NS2 on Linux and Windows

For Windows I am using Windows 11 and WSL2 but you cn also run a VM and use the install NS2 from Linux guide below

## Windows only

### Enabling WSL2
1.Search for `turn windows features on or off` and open it

<img width="179" alt="{4FD9D34E-0BBB-41F6-B6C0-9258B3681461}" src="https://github.com/user-attachments/assets/ef908d2e-7a70-4853-a303-9600cf23bfe0" />

2.Then enable `Windows Subsystem for Linux`

<img width="348" alt="{F5E3AFC8-22CF-4244-B329-07595120DDEB}" src="https://github.com/user-attachments/assets/429c67e1-d0a0-428d-831b-543dc69e4242" />

3.Continue the installation (the system may reastart a few times)

4.Once done, grab a `Powershell` and type
```
wsl --version
```

<img width="865" alt="{B6F87DF7-4F6C-48A4-8ED0-63542B765BA8}" src="https://github.com/user-attachments/assets/339bf2eb-28f0-400d-868c-6f09d5d0db9b" />

If it is asking for update just run
```
wsl --update
```
In the end you should get something like the folwoing

<img width="564" alt="{02AFB8B4-AC4E-4A3E-9C57-C5CB6DBEA19A}" src="https://github.com/user-attachments/assets/6f3610ba-8062-4020-af7d-44c4d1f5a815" />

5.Install Linux

You can use either Store or WSL to download the linux distro of your choice
I am going to install Ubuntu 24.04
Simply run:
```
wsl --list --online
```
And choose the distor you like

<img width="737" alt="{31ACED1C-0848-4849-9114-AEFE522750FA}" src="https://github.com/user-attachments/assets/57d81be4-4877-406f-b27a-d855f0fe880e" />

I use `Ubuntu-24.04`
```
wsl --install Ubuntu-24.04
```



Once installed, set a username and password

We are done here

The rest applies to both Linux and Windows

## Linux and Windows
If you are a Windows user, just make sure you have already installed WSL2 as mentioned above

Log into your distro and do the following:

1.Update packages (if running another distro use your own package manager `yum` `rpl` etc...)
```
sudo apt update && sudo apt upgrade -y
```

2.Install NS2 and TCl
```
sudo apt install ns2 tcl
```

3.You are going to need NetowrkAnimator(nam) for visualaizations unfortunately the apt version does not work so use the version provided on this repo:
```
wget https://github.com/Rohamgames/ns2-windows-linux/raw/refs/heads/main/nam_1.14_amd64.deb
sudo dpkg -i nam_1.14_amd64.deb
```

4.Verify ns2 installation:
run `ns` and then you should see `%` you may get ns2 version if needed:
```
ns-version 
```

<img width="198" alt="{E35C791E-CB1F-458E-8C12-21750BD12ECB}" src="https://github.com/user-attachments/assets/11f84b65-d3b2-478a-a002-e72d5849f9e3" />

5.Test sample code:
First download:
```
wget https://github.com/Rohamgames/ns2-windows-linux/raw/refs/heads/main/sample.tcl
```

Then execute:
```
ns sample.tcl
```
You should see something like this:

<img width="293" alt="{6FCE7974-7BDC-4503-A318-D79E0A6A0A9C}" src="https://github.com/user-attachments/assets/a9bd2afd-8531-4fdd-995a-306c7a774f17" />

Thats all

Enjoy

