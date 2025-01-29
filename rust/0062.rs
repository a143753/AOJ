use std::io::BufRead;

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

fn f(x: String) -> i32 {
    let mut v = x
        .chars()
        .map(|c| c.to_string().parse::<i32>().unwrap())
        .collect::<Vec<_>>();

    for _ in 0..9 {
        let mut w = Vec::new();
        for i in 0..v.len() - 1 {
            w.push((v[i] + v[i + 1]) % 10);
        }
        v = w;
    }
    v[0]
}

fn main() {
    let reader = std::io::stdin();
    let d = read_col_vec::<String>(&mut reader.lock(), 0);

    d.iter().for_each(|x| println!("{}", f(x.to_string())));
}
