
prompt = function() {
    return db.getName() + '> '
}

// Print out more than 20 document
DBQuery.shellBatchSize = 200

lsc = function() {
    return db.getCollectionNames()
}

