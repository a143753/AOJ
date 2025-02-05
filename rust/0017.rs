use std::convert::TryInto;
use std::io::BufRead;

fn f(x: u8, k: u8) -> u8 {
    let ca = 'a'.to_ascii_lowercase() as u8;
    let cz = 'z'.to_ascii_lowercase() as u8;

    if x + k > cz {
        x + k - cz + ca - 1
    } else {
        x + k
    }
}

fn chk(sv: Vec<String>) -> u8 {
    for i in 0..sv.len() {
        let h = sv[i].chars().collect::<Vec<_>>()[0] as i32;
        let k = (26 - h + 't'.to_ascii_lowercase() as i32) % 26;
        let w = dec(sv[i].to_string(), k.try_into().unwrap());

        if w == "the" || w == "this" || w == "that" {
            return k.try_into().unwrap();
        }
    }
    0
}

fn dec(s: String, k: u8) -> String {
    let mut w = String::new();
    s.chars().for_each(|x| {
        if x.is_alphabetic() {
            w += (f(x as u8, k).to_ascii_lowercase() as char)
                .to_string()
                .as_str();
        } else {
            w += &x.to_string();
        }
    });
    w
}

fn main() {
    let reader = std::io::stdin();
    let reader = reader.lock();

    reader.lines().for_each(|line| {
        let l = line.unwrap();
        let v0: Vec<_> = l
            .split_whitespace()
            .map(|x| x.to_string())
            .collect::<Vec<_>>();
        let mut v1: Vec<String> = Vec::new();

        for i in 0..v0.len() {
            let w = v0[i]
                .chars()
                .filter(|x| x.is_alphabetic())
                .collect::<String>();
            v1.push(w);
        }

        let k = chk(v1);
        println!("{}", dec(l, k));
    });
}
