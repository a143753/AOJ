use std::io::prelude::*;
use std::str::FromStr;

fn parse( s : String ) -> Vec<i32> {
    s.split_whitespace().map(|x| i32::from_str(x).unwrap()).collect()
}

fn ans( a:i32, b:i32 ) -> i32 {
    (a+b).to_string().len() as i32
}

fn main() {
    let reader = std::io::stdin();
    reader.lock().lines().for_each(|line|{
        let v= parse(line.unwrap());
        let n = ans(v[0],v[1]);
        println!("{:?}",n);
    });
}
