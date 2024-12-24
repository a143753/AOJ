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

fn h(v: Vec<i32>, n: i32) -> Vec<i32> {
    v.iter().map(|x| x * n).collect()
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v1 = read_row_vec::<i32>(&mut reader.lock());
    let k = read_scalar::<i32>(&mut reader.lock());

    f(&v1);
    let v2 = h(v1, k);
    f(&v2);
}
