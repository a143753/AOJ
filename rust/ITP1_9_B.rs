use std::io::BufRead;

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

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

fn f(v: String, n: i32) -> String {
    let h = v[..n as usize].to_string();
    let t = v[n as usize..].to_string();
    format!("{}{}", t, h)
}

fn main() {
    let reader = std::io::stdin();

    loop {
        let mut w = read_line(&mut reader.lock());
        if w == "-" {
            break;
        } else {
            let n = read_scalar::<i32>(&mut reader.lock());
            let q = read_col_vec::<i32>(&mut reader.lock(), n as usize);
            q.iter().for_each(|x| {
                w = f(w.clone(), *x);
            });
            println!("{}", w);
        }
    }
}
