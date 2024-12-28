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

fn read_col_vec<T: std::str::FromStr>(reader: &mut std::io::StdinLock, n: i32) -> Vec<T>
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

fn f(v: Vec<i32>, q: Vec<i32>) -> Vec<String> {
    let mut ret = Vec::new();

    for x in q {
        if v.contains(&x) {
            ret.push("Yes".to_string());
        } else {
            ret.push("No".to_string());
        }
    }
    ret
}

fn main() {
    let reader = std::io::stdin();
    let _ = read_scalar::<i32>(&mut reader.lock());

    let v = read_row_vec::<i32>(&mut reader.lock());
    let n = read_scalar::<i32>(&mut reader.lock());
    let q = read_col_vec::<i32>(&mut reader.lock(), n);

    let a: Vec<String> = f(v, q);

    a.iter().for_each(|x| println!("{}", x));
}
