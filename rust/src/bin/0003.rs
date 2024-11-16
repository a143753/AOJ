use std::io::prelude::*;
use std::str::FromStr;

fn ans( mut d : Vec<i32> ) -> String {
   d.sort_unstable();
   let c = d[0].pow(2) + d[1].pow(2) == d[2].pow(2);
   if c {
       "YES".to_string()
   } else {
       "NO".to_string()
   }
}

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().skip(1).for_each(|line|{
        let v= line.unwrap().split_whitespace().map(|x| i32::from_str(x).unwrap()).collect();
        let n = ans(v);
        println!("{}",n);
    });
}
