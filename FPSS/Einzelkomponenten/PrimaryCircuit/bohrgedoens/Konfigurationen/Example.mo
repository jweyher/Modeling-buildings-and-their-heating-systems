within FPSS.Einzelkomponenten.PrimaryCircuit.bohrgedoens.Konfigurationen;
record Example
  "Example definition of a borefield data record"
  extends AixLib.Fluid.Geothermal.Borefields.Data.Borefield.Template(
      filDat=POF.Einzelkomponenten.bohrgedoens.Konfigurationen.Bentonite(),
      soiDat=POF.Einzelkomponenten.bohrgedoens.Konfigurationen.SandStone(),
      conDat=POF.Einzelkomponenten.bohrgedoens.Konfigurationen.KonfBsp());
  annotation (
defaultComponentPrefixes="parameter",
defaultComponentName="borFieDat",
Documentation(
info="<html>
<p>This record presents an example on how to define borefield records
using the template in
<a href=\"modelica://AixLib.Fluid.Geothermal.Borefields.Data.Borefield.Template\">
AixLib.Fluid.Geothermal.Borefields.Data.Borefield.Template</a>.</p>
</html>",
revisions="<html>
<ul>
<li>
July 15, 2018, by Michael Wetter:<br/>
Revised implementation, added <code>defaultComponentPrefixes</code> and
<code>defaultComponentName</code>.
</li>
<li>
June 28, 2018, by Damien Picard:<br/>
First implementation.
</li>
</ul>
</html>"),
   __Dymola_LockedEditing="Model from IBPSA");
end Example;
