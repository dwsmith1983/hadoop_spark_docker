# http://localhost:8080
# briged
# http://localhost:5380

declare -ra args=(
    --name dnsmasq
    -d
    # for bridged...
    #-p 67:67/udp # dhcp
    #-p 68:68/udp # dhcp
    #-p 53:53/udp # dns
    #-p 5380:8080 # webadmin 5380
    -v ./dnsmasq.conf:/etc/dnsmasq.conf
    --log-opt "max-size=100m"
    -e "HTTP_USER=<user>"
    -e "HTTP_PASS=<password>"
    --restart always
    --net=host   # bind to host ip
    --cap-add=NET_ADMIN # source does ARP-injection
    jpillora/dnsmasq
    )

docker run ${args[@]}
