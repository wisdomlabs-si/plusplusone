import React from "react";
import classNames from "classnames";

type PropertyItemProps = {
  className?: string;
  children: React.ReactNode;
  flexDirection?: string;
  border?: boolean;
  column?: boolean;
};

const PropertyItem: React.FC<PropertyItemProps> = ({ className, children, flexDirection, border, column }) => {
  const classList = classNames({
    "c-Props__item": true,
    "c-Props__item--column": column === true,
    "c-Props__item--border": border === true,
  });

  return <div className={`${classList} ${className || ""} ${flexDirection || ""}`}>{children}</div>;
};

export default PropertyItem;
