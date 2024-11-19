fn ans(dt: Vec<(String, i32)>) {
    let mut p = 0;
    let mut f = false;
    for m in ["S", "H", "C", "D"].iter() {
        for i in 1..14 {
            if !f && dt[p].0 == *m && dt[p].1 == i {
                p += 1;
                if p == dt.len() {
                    f = true;
                }
            } else {
                println!("{} {}", *m, i);
            }
        }
    }
}

fn main() {
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).unwrap();
    let n = buf.trim().parse::<i32>().unwrap();

    let mut d: Vec<(String, i32)> = Vec::new();
    (0..n).for_each(|_| {
        let mut buf = String::new();
        std::io::stdin().read_line(&mut buf).unwrap();
        let v = buf.trim().split_whitespace().collect::<Vec<_>>();

        d.push((v[0].to_string(), v[1].parse::<i32>().unwrap()));
    });

    d.sort_by(|a, b| {
        if a.0 == b.0 {
            a.1.cmp(&b.1)
        } else {
            let t = ["S", "H", "C", "D"];
            let ia = t.iter().position(|&x| x == a.0).unwrap();
            let ib = t.iter().position(|&x| x == b.0).unwrap();
            ia.cmp(&ib)
        }
    });

    ans(d.clone());
}
