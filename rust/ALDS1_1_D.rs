use std::io::{self, BufRead};

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
    reader.lines().take(n as usize).for_each(|line| {
        let d = line.unwrap().parse::<T>().unwrap();
        col.push(d);
    });
    col
}

fn f(v: Vec<i32>) -> i32 {
    let mut a = v[1] - v[0];
    let mut ini = true;
    let mut m = v[0];

    for i in 0..v.len() - 1 {
        let b = v[i];

        if ini || m == b {
            m = *v[i + 1..].iter().max().unwrap();
            ini = false;
        }
        if a < m - b {
            a = m - b;
        }
    }
    a
}

fn main() {
    let reader = io::stdin();
    let n: i32 = read_scalar(&mut reader.lock());

    let v: Vec<i32> = read_col_vec(&mut reader.lock(), n as usize);

    let a = f(v);

    println!("{}", a);
}
