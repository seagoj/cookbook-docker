%w(make linux-image-generic-lts-raring linux-headers-generic-lts-raring).each do |p|
    package p
end

execute "Add Docker repo to local keychain"
    user "root"
    command "apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9"
end

execute "Add the Docker repo to the apt sources list and install the docker package"
    user "root"
    command 'sh -c "echo deb http://get.docker.io/ubuntu docker main\
    > /etc/apt/sources.list.d/docker.list"'
end

package lxc-docker
