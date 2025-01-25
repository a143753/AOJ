use std::cmp::max;
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

fn read_line(reader: &mut std::io::StdinLock) -> String {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.trim().to_string()
}

const N: usize = 16;

fn str2bigint(s: String) -> Vec<u64> {
    let mut p: Vec<u64> = Vec::new();
    let mut sr = s.chars().rev().collect::<String>();
    loop {
        if sr.len() > N {
            let sp = sr[0..N].to_string();
            p.push(sp.chars().rev().collect::<String>().parse::<u64>().unwrap());
            sr = sr[N..].to_string();
        } else {
            p.push(sr.chars().rev().collect::<String>().parse::<u64>().unwrap());
            break;
        }
    }
    p
}

fn f(a: Vec<u64>, b: Vec<u64>) -> Vec<u64> {
    let mut c: Vec<u64> = Vec::new();
    let mut carry = 0;
    let len = max(a.len(), b.len());

    for i in 0..len {
        let ai = if i < a.len() { a[i] } else { 0 };
        let bi = if i < b.len() { b[i] } else { 0 };

        let x = ai + bi + carry;
        c.push(x % 10_u64.pow(N as u32));
        carry = x / 10_u64.pow(N as u32);
    }
    if carry > 0 {
        c.push(carry);
    }
    c
}

fn bigint2str(v: Vec<u64>) -> String {
    let mut s = String::new();

    if v.len() > 5 {
        return "overflow".to_string();
    }

    for i in 0..v.len() {
        let idx = v.len() - 1 - i;
        if i == 0 {
            s.push_str(&format!("{}", v[idx]));
        } else {
            s.push_str(&format!("{:016}", v[idx]));
        }
    }
    s
}

fn main() {
    let reader = std::io::stdin();
    let n = read_scalar::<usize>(&mut reader.lock());

    for _ in 0..n {
        let a = str2bigint(read_line(&mut reader.lock()));
        let b = str2bigint(read_line(&mut reader.lock()));
        let s = bigint2str(f(a, b));
        println!("{}", s);
    }
}
