
kubernetes switch : "switch\n"
kubernetes namespace : "ns\n"
stern <user.text>:
    insert("stern --exclude-container istio-proxy ")
    insert(text)
    insert("\n")
kubernetes <user.text> :
    insert("kubectl ")
    insert(text)
