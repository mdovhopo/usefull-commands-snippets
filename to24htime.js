const to24htime = time => {
    const ten = i => (i < 10 ? '0' : '') + i;
    return time.replace(/([0-9]{1,2}):([0-9]{1,2})\s?(pm|am)/i, (...match) => {
      const [, hours, minutes, partOfDay] = match;
      let HH = +hours;
      let MM = +minutes;
      if (/am/i.test(partOfDay) && HH === 12 ) {
        HH -= 12;
      }
      if (/pm/i.test(partOfDay) && HH >= 1 && HH < 12) {
        HH += 12;
      }
      return `${ten(HH)}:${ten(MM)}`;
    });
  }
