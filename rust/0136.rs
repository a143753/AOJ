use std::collections::HashMap;
use std::io::BufRead;

fn read_scalar<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> T
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut scalar = None;
    reader.lines().take(1).for_each(|line| {
        scalar = Some(line.unwrap().parse::<T>().unwrap());
    });
    scalar.unwrap()
}
fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: usize) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut col = Vec::new();
    if n == 0 {
        reader.lines().for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    } else {
        reader.lines().take(n as usize).for_each(|line| {
            let d = line.unwrap().parse::<T>().unwrap();
            col.push(d);
        });
    }
    col
}

fn g(d: f32) -> i32 {
    if d < 165.0 {
        1
    } else if d < 170.0 {
        2
    } else if d < 175.0 {
        3
    } else if d < 180.0 {
        4
    } else if d < 185.0 {
        5
    } else {
        6
    }
}

fn f(d: Vec<f32>) {
    let mut h = HashMap::new();

    for x in d {
        let i = g(x);
        *h.entry(i).or_insert(0) += 1;
    }

    for i in 1..=6 {
        print!("{}:", i);
        for _ in 0..*(h.get(&i).unwrap_or(&0)) {
            print!("*");
        }
        println!();
    }
}

fn main() {
    let reader = std::io::stdin();
    let n = read_scalar::<i32>(&mut reader.lock());
    let d = read_col_vec::<f32>(&mut reader.lock(), n as usize);

    f(d);
}
