// Mongo shell does not have configuration file.
// So I create this and assign an alias for execute this when start new shell
// Example: alias mongoshell='mongo ~/.mongoshell.js --shell'

prompt = function() {
    return db.getName() + '> '
}

// Print out more than 20 document
DBQuery.shellBatchSize = 200

lsc = function() {
    return db.getCollectionNames()
}

