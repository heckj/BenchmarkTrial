//
//  SampleModel.swift
//  BenchmarkTrial
//
//  Created by Joseph Heck on 12/16/21.
//

import Foundation
import CollectionsBenchmark

struct Model {
    var benchmark = Benchmark(title: "2D Example Benchmark")
    
    func addBenchmarks() {
        benchmark.addSimple(
            title: "Array<Int> sorted",
            input: [Int].self
        ) { input in
            blackHole(input.sorted())
        }
        
        benchmark.add(
            title: "Set<Int> contains",
            input: ([Int], [Int]).self
        ) { input, lookups in
            let set = Set(input)
            return { timer in
                for value in lookups {
                    precondition(set.contains(value))
                }
            }
        }
    }
}
