struct b {
  template <class c> using d = c *;
};
template <class e, class aa> using f = e ::template d<aa>;
long g;
struct h;
class i {
public:
  f<b, h> operator->();
};
int j, aj;
struct h {
  using k = long;
  enum { l = sizeof(k) * 8 };
  int m() {
    j = __builtin_ctzll(g);
    return j;
  }
};
class n {
  using am = i;
  enum { l = h::l };
  class o {
    am ao;
    void m_fn2() { aj = ao->m() % l; }

  public:
    o &operator++() {
      m_fn2();
      return *this;
    }
    o operator++(int) { ++*this; }
  };

public:
  using aq = o;
};
void a() { n::aq aw(aw++); }
