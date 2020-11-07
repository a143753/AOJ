use std::io::prelude::*;
use std::str::FromStr;

fn ans( mut d : Vec<i32> ) -> String {
   d.sort();
   let c = d[0].pow(2) + d[1].pow(2) == d[2].pow(2);
   if c {
       "YES".to_string()
   } else {
       "NO".to_string()
   }
}

fn main() {
    let stdin = std::io::stdin();

    let mut idt = stdin.lock().lines();
    let n:i32 = idt.next().unwrap().unwrap().parse().expect("error");

    for _ in 0..n {
        let d : Vec<i32> = idt.next().unwrap().unwrap().split_whitespace().map(|x| i32::from_str(x).unwrap()).collect();
        let a = ans(d);
        println!("{}",a);
    }
}
