use std::io::prelude::*;

// エラトステネスの篩
fn primes(n:i32) -> Vec<i32> {
    let mut t: Vec<i32> = (2..n).collect();
    let nn = n as usize;

    for p in 2..nn {
        if t[p - 2] != 0 {
            let mut q = p * 2;
            while q < nn {
                t[q - 2] = 0;
                q += p;
            }
        }
    }
    t.into_iter().filter(|&x| x != 0).collect()
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

