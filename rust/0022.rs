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

fn ans(v: Vec<i32>) -> i32 {
    let mut max = v[0];
    for i in 0..v.len() {
        let mut sum = 0;
        for j in i..v.len() {
            sum += v[j];
            if sum > max {
                max = sum;
            }
        }
    }
    max
}

fn main() {
    let reader = std::io::stdin();
    let mut reader = reader.lock();

    loop {
        let n: usize = read_scalar(&mut reader);
        if n == 0 {
            break;
        }

        let v = read_col_vec(&mut reader, n);
        let a = ans(v);
        println!("{}", a);
    }
}
