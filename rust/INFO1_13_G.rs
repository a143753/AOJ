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

fn f(v: &Vec<i32>) {
    print!("(");
    print!(
        "{}",
        v.iter()
            .map(|x| x.to_string())
            .collect::<Vec<_>>()
            .join(", ")
    );
    print!(")");
    println!();
}

fn g(v1: Vec<i32>, v2: Vec<i32>) -> Vec<i32> {
    v1.iter().zip(v2.iter()).map(|(x, y)| x + y).collect()
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v1 = read_row_vec::<i32>(&mut reader.lock());
    let v2 = read_row_vec::<i32>(&mut reader.lock());

    f(&v1);
    f(&v2);
    let v3 = g(v1, v2);
    f(&v3);
}
