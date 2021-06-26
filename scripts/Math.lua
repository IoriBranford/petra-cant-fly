function math.dot(x, y, x2, y2)
    return x2*x + y2*y
end

function math.det(x, y, x2, y2)
    return x*y2 - y*x2
end

function math.lensq(x, y)
    return x*x+y*y
end

function math.len(x, y)
    return math.sqrt(x*x + y*y)
end

function math.norm(x, y)
    local len = math.sqrt(x*x + y*y)
    return x/len, y/len
end