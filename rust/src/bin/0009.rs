use std::io::prelude::*;

fn primes(n:i32) -> Vec<i32> {
    let mut t : Vec<i32> = (0..n).collect();
    t[1] = 0;
    
    let mut p : usize = 2;
    let nn = n as usize;

    'outer : while p < nn {
        'inner : loop {
            if p >= nn {
                break 'outer
            } else if t[p] != 0 {
                break 'inner;
            } else { 
                p = p + 1;
            }
        }
        
        let mut q = p * 2;
        while q < nn {
            t[q] = 0;
            q = q + p;
        }
        p = p + 1;
    }

    t.retain(|&x| x != 0);
    
    t 
}

fn ans(n:i32, p:&Vec<i32>) -> i32 {
    let mut i = 0;
    for x in p.iter() {
        if *x > n {
            break;
        }
        i = i + 1;
    }
    i as i32
}

fn main() {
    let p = primes(1000000);
    
    let stdin = std::io::stdin();
    for line in stdin.lock().lines() {
        let d : i32 = line.unwrap().parse().unwrap();
        let a = ans(d, &p);
        println!("{}",a);
    }
}

