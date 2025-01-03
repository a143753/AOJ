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

fn read_row_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock) -> Vec<T>
where
    <T as std::str::FromStr>::Err: std::fmt::Debug,
{
    let mut row = Vec::new();
    reader.lines().take(1).for_each(|line| {
        row = line
            .unwrap()
            .split_whitespace()
            .map(|x| x.parse::<T>().unwrap())
            .collect::<Vec<_>>();
    });
    row
}
fn f(v1: &Vec<f64>, v2: &Vec<f64>, n: i32) -> f64 {
    let mut sum = 0.0;
    for (x, y) in v1.iter().zip(v2.iter()) {
        let dt = (x - y).abs();
        sum += dt.powi(n);
    }
    sum.powf(1.0 / n as f64)
}
fn g(v1: &Vec<f64>, v2: &Vec<f64>) -> f64 {
    let mut max = 0.0;
    for (x, y) in v1.iter().zip(v2.iter()) {
        let dt = (x - y).abs();
        if max < dt {
            max = dt;
        }
    }
    max
}

fn main() {
    let reader = std::io::stdin();

    let _ = read_scalar::<i32>(&mut reader.lock());

    let v1 = read_row_vec::<f64>(&mut reader.lock());
    let v2 = read_row_vec::<f64>(&mut reader.lock());

    let a1 = f(&v1, &v2, 1);
    let a2 = f(&v1, &v2, 2);
    let a3 = f(&v1, &v2, 3);
    let aa = g(&v1, &v2);

    println!("{:.6}", a1);
    println!("{:.6}", a2);
    println!("{:.6}", a3);
    println!("{:.6}", aa);
}
