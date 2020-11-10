use std::io::prelude::*;

fn main() {
    let stdin = std::io::stdin();

    let l = stdin.lock().lines().next().unwrap().unwrap();
    let a = l.chars().rev().collect::<String>();
   
    println!("{}",a);
}
