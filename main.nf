#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'

    echo 'Sleeping 1 min...'
    sleep 1m
    """
}

workflow {
  Channel.of('Hello', 'Hola', 'Bonjour', 'Guten Tag') | sayHello | view
}
