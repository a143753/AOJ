use std::io;

fn main() {
    let mut line = String::new();

    io::stdin().read_line(&mut line).unwrap();
    let a = line.trim().chars().rev().collect::<String>();
   
    println!("{}",a);
}
