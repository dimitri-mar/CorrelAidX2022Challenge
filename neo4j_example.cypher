// A few CYPHER commands to test 


// this command help visualize the schema
CALL db.schema.visualization()

// MATCH allows to search for patterns
// and RETURN shapes the response. 
MATCH (n:Officer) 
RETURN n LIMIT 25

// () represents nodes
// -> represents edges (we will see them later)


MATCH (b) 
WHERE b.name CONTAINS "BERLUSCONI" 
RETURN  *

MATCH (b) 
WHERE LOWER(b.name) CONTAINS LOWER("berlusconi") 
RETURN  *

MATCH (b) 
WHERE b.name =~ "(?i).*berlusconi.*"  // USES THE Java Regular expressions
RETURN  *




// The address is very interesting
MATCH (n)  
where n.node_id =  240000001
return *

// we can get only the address actual value
MATCH (n)  
where n.node_id =  240000001
return n.address



// or we can look to all the nodes connected
// to that particular address
MATCH (a:Address) -- (b)
WHERE a.node_id = 240000001
RETURN  count(b)   // how many nodes do we find


MATCH (a:Address) -- (b)
WHERE a.node_id = 240000001
RETURN  distinct labels(b)  // what labels have these nodes



// or we can just extract a table with all the entities 
MATCH (a:Address) -- (b:entities)
WHERE a.node_id = 240000001
RETURN  b.node_id, b.name  

// go back to python


// we can also give a name to the entire path
MATCH p= (a) --> (b)
WHERE b.node_id = 54662
RETURN  p


// we can check relationships labeled as "similar"
MATCH p=()-[r:similar]->() 
RETURN p LIMIT 25

// you can search also for longer paths
MATCH p=()-[:similar *3..4]->() 
RETURN p limit 10