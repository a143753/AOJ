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

fn f(mut d: i32) -> Vec<i32> {
    let mut r = Vec::new();
    for _ in 0..10 {
        d = d * d / 100 % 10000;
        r.push(d);
    }
    r
}

fn main() {
    let reader = std::io::stdin();
    let n = read_scalar::<i32>(&mut reader.lock());
    let d = read_col_vec::<i32>(&mut reader.lock(), n as usize);
    for i in 0..n {
        println!("Case {}:", i + 1);
        let a = f(d[i as usize]);
        a.iter().for_each(|x| println!("{}", x));
    }
}
