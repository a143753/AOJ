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

fn f(v: Vec<i32>, n: i32) -> i32 {
    let mut ret = -1;
    for (i, x) in v.iter().enumerate() {
        if *x == n {
            ret = i as i32;
            break;
        }
    }
    ret
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v = read_row_vec::<i32>(&mut reader.lock());
    let k = read_scalar::<i32>(&mut reader.lock());

    let a: i32 = f(v, k);

    println!("{}", a);
}
